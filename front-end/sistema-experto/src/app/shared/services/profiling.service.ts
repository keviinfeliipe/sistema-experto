import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { MovieDto } from '../models/movie-dto';

@Injectable({
  providedIn: 'root'
})
export class ProfilingService {
  private url: string = "http://localhost:19080/api/v1/profiling";
  constructor(
    private http:HttpClient
  ) { }

  findAll(username:string): Observable<MovieDto[]> {
    let newUrl= this.url+"/"+username+"/page";
    return this.http.get<MovieDto[]>(newUrl);
  }
  findAllByGenre(username:string, genre:string): Observable<MovieDto[]> {
    let newUrl= this.url+"/"+username+"/"+genre;
    return this.http.get<MovieDto[]>(newUrl);
  }
}
