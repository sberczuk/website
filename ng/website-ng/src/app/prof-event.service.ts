import {Injectable} from '@angular/core';
import {ProfEvent} from "./profEvent";
import {Observable, of} from "rxjs";
import {ActivatedRoute} from "@angular/router"
import {HttpClient, HttpHeaders} from '@angular/common/http';


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
  constructor(private http:HttpClient, private route: ActivatedRoute) {
    const url: Observable<string> = route.url.map(segments => segments.join(''));
  }

  // REquire works...
  // TRy to get http working
   getProfEvents(): Observable<ProfEvent[]> {
    // of() version works: trying to get http version working
     // make the host port configurable/dynamic
     return this.http.get<ProfEvent[]>("http://localhost:4200/assets/events.json")
    //return of(content)
   //return this.profEvents
  }
}
