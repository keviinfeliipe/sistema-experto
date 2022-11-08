import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AnswerResponse } from '../models/answer-response';
import { AnswerDto } from '../models/answer-dto';

@Injectable({
  providedIn: 'root'
})
export class AnswerService {

  private url: string = "http://localhost:19080/api/v1/answer";

  constructor(
    private http:HttpClient
  ) { }

  saveAnswer(answerResponse:AnswerResponse): Observable<any>{
    let newUrl = this.url+"/save-answer";
    return this.http.post<any>(newUrl,answerResponse);
  }

  getAnswer(username:string): Observable<AnswerDto>{
    let newUrl = this.url+"/"+username+"/current";
    return this.http.get<AnswerDto>(newUrl);
  }

  validateNextAsk(username:string): Observable<Boolean>{
    let newUrl = this.url+"/"+username+"/validate-next-ask";
    return this.http.get<Boolean>(newUrl);
  }

  getGenres(username:string): Observable<string[]>{
    let newUrl = this.url+"/"+username+"/genres";
    return this.http.get<string[]>(newUrl);
  }

}
