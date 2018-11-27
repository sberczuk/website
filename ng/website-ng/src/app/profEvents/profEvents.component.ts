import {Component, OnInit} from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable} from "rxjs";
import {ProfEventService} from "../prof-event.service";

import {ProfEvent} from '../profEvent'

@Component({
  selector: 'app-profEvents',
  templateUrl: './profEvents.component.html',
  styleUrls: ['./profEvents.component.css']
})
export class ProfEventsComponent implements OnInit {
  profEvents: ProfEvent[]
    //= [
  //   {title: "boopBeep1", description: 'SandStorm1'},
  //   {title: "boopBeep2", description: 'SandStorm2'},
  //   {title: "boopBeep3", description: 'SandStorm3'},
  // ]


 //profEvents: ProfEvent[]

  constructor(private profEventService: ProfEventService) {
    console.log("LOADING")
  }

  ngOnInit() {
    this.profEventService.getProfEvents().subscribe(profEvents => this.profEvents = profEvents)
    //this.profEvents = this.profEventService.getProfEvents()

  }

}
