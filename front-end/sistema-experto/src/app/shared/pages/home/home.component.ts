import {Component,HostListener,OnInit,ViewChild} from '@angular/core';
import { MovieDto } from '../../models/movie-dto';
import { AuthServiceService } from '../../services/auth-service.service';
import { ProfilingService } from '../../services/profiling.service';
import { UserService } from '../../services/user.service';
import { ViewportScroller } from '@angular/common';
import { NgbModal, NgbModalConfig } from '@ng-bootstrap/ng-bootstrap';
import { AnswerResponse } from '../../models/answer-response';
import { AnswerDto } from '../../models/answer-dto';
import { AnswerService } from '../../services/answer.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent implements OnInit {
  @ViewChild('content') content: any;

  movies: MovieDto[] = [];
  moviesProfiling: MovieDto[] = [];
  user: string = '';
  username: string | undefined;
  userRespose: AnswerResponse = {
    username: '',
    response: '',
  };

  answer: AnswerDto = {
    ask: '',
    response: '',
    path: '',
  };

  public isCollapsed = false;
  @HostListener('window:scroll', []) onScroll() {
    if (this.scroll.getScrollPosition()[1] > 70) {
      this.isNavCollapse = true;
    } else {
      this.isNavCollapse = false;
    }
  }

  genres: string[] = [];
  isNavCollapse = false;

  constructor(
    public authService: AuthServiceService,
    private profilingService: ProfilingService,
    private userService: UserService,
    private scroll: ViewportScroller,
    config: NgbModalConfig,
    private modalService: NgbModal,
    private answerService: AnswerService
  ) {
    config.backdrop = 'static';
    config.keyboard = false;
  }

  ngOnInit(): void {
    !this.authService.isLoggedIn ? this.authService.router.navigate(['login']): '';
    this.validate();
  }


  validate(): void {
    const userJson = JSON.parse(localStorage.getItem('user') || '{}');
    if (userJson !== null) {
      let userconcurrent = JSON.parse(JSON.stringify(userJson));
      this.user = userconcurrent.email;
      this.userService.validateUser(this.user).subscribe((data) => {
        if (!data) {
          this.getAnswer();
          this.modalService.open(this.content);
        } else {
          this.validateNextAsk(this.user);
        }
      });

    }
  }

  onWheel(event: WheelEvent): void {
    if (event.deltaY > 0) this.scrollToRight();
    else this.scrollToLeft();
  }

  scrollToLeft(): void {
    const newLocal: HTMLElement | null = document.getElementById('scroll-1');
    if (newLocal) {
      newLocal.onmouseout = () => {
        newLocal.scrollLeft += 400;
      };
    }
  }

  scrollToRight(): void {
    document.getElementById('scroll-1')!.scrollLeft += 400;
  }

  saveAnswer(value: string) {
    const userJson = JSON.parse(localStorage.getItem('user') || '{}');
    let userconcurrent = JSON.parse(JSON.stringify(userJson));
    this.userRespose.username = userconcurrent.email;
    this.userRespose.response = value;
    this.answerService.saveAnswer(this.userRespose).subscribe((data) => {
      if (data) {
        this.authService.router.navigate(['login']);
      } else {
        this.getProfiling(userconcurrent.email);
        this.modalService.dismissAll(this.content);
      }
    });
  }

  getAnswer() {
    const userJson = JSON.parse(localStorage.getItem('user') || '{}');
    let userconcurrent = JSON.parse(JSON.stringify(userJson));
    this.answerService.getAnswer(userconcurrent.email).subscribe((data) => {
      this.answer = data;
    });
  }


  getProfiling(username: string): void {
    this.profilingService.findAll(username).subscribe((data) => {
      this.moviesProfiling = data;
      //this.getMovieByGenres(username);
    });
  }

  getMovieByGenres(username:string) {
    this.answerService.getGenres(username).subscribe((data) => {
      this.genres = data;
      data.forEach((genre) => {
        this.profilingService
          .findAllByGenre(username, genre)
          .subscribe((data) => {
            this.movies = [...this.movies, ...data];
          });
      });
    });
  }

  validateNextAsk(username: string): void {
    this.answerService.validateNextAsk(username).subscribe((data) => {
      if (data) {
        this.getAnswer();
        this.modalService.open(this.content);
      } else {
        this.getProfiling(username);
      }
    });
  }

  calculateTotal():number{
    return this.moviesProfiling.map(data => data.probability).reduce(function (previous, current) {
      return previous + current;
  }, 0);
  }

  async newProfiling():Promise<void>{
    const userJson = JSON.parse(localStorage.getItem('user') || '{}');
    if (userJson !== null) {
      let userconcurrent = JSON.parse(JSON.stringify(userJson));
      this.user = userconcurrent.email;
      this.userService.newAttention(this.user).subscribe(()=>{
        this.getAnswer();
        this.authService.router.navigate(['home']);
        this.modalService.open(this.content);
      });



    }
  }

}
