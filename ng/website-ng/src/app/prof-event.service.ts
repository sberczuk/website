import {Injectable} from '@angular/core';
import {ProfEvent} from "./profEvent";
import {Observable, of} from "rxjs";
import {HttpClient, HttpHeaders} from '@angular/common/http';
const content = require('./events.json');


@Injectable({
  providedIn: 'root'
})
export class ProfEventService {

  profEvents: ProfEvent[] = [
    {title: "boopBeep1", description: 'SandStorm1'},
    {title: "boopBeep2", description: 'SandStorm2'},
    {title: "boopBeep3", description: 'SandStorm3'},
  ]


  // Observable stops display?
  constructor(private http:HttpClient) {
  }

  // REquire works...
  // TRy to get http working
   getProfEvents(): Observable<ProfEvent[]> {
    // of() version works: trying to get http version working
     // also try 'require' version
    // return this.http.get<ProfEvent[]>("events.json")
    return of(content)
   //return this.profEvents
  }
}
