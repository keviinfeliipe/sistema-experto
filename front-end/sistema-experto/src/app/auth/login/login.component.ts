import { Component, OnInit } from '@angular/core';
import { AuthServiceService  } from '../../shared/services/auth-service.service';
import { UserLogin } from '../../shared/models/user-login'
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  userData: any;
  user :UserLogin = {
    username : '',
    password : ''
  }

  constructor(
    public authService: AuthServiceService
  ) {

  }

  login(): void{
    this.authService.GoogleAuth().then(()=>{window.location.reload()});
  }

  ngOnInit(): void {
    this.authService.isLoggedIn? this.authService.router.navigate(['../shared/pages/home']):"";
  }


}
