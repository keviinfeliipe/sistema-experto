import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { MovieDto } from '../models/movie-dto';

@Injectable({
  providedIn: 'root'
})
export class MovieService {
  static findAll(value: String) {
    throw new Error('Method not implemented.');
  }

  private url: string = "http://localhost:19080/api/v1/movie";
  constructor(
    private http:HttpClient
  ) { }

  findAll(genre:string): Observable<MovieDto[]> {
    let newUrl= this.url+"/"+genre+"/page";
    return this.http.get<MovieDto[]>(newUrl);
  }
}
