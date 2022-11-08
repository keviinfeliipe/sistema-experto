import { Component, OnInit } from '@angular/core';
import { AuthServiceService } from '../../shared/services/auth-service.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  userData: any;

  constructor(
    public authService: AuthServiceService
  ) {

  }

  ngOnInit(): void {

  }

}
