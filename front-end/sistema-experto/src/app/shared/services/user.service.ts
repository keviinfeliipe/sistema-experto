import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { UserModel } from '../models/user-model';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private url: string = "http://localhost:19080/api/v1/user";

  constructor(
    private http:HttpClient
  ) { }

  validateUser(email:string): Observable<any>{
    let newUrl= this.url+"/validate-user/"+email;
    return this.http.get<any>(newUrl);
  }

  newAttention(email:string): Observable<any>{
    let newUrl= this.url+"/new-attention/"+email;
    return this.http.get<any>(newUrl);
  }

}
