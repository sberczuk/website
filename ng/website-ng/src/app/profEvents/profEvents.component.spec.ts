import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfEventsComponent } from './profEvents.component';

describe('ProfEventsComponent', () => {
  let component: ProfEventsComponent;
  let fixture: ComponentFixture<ProfEventsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfEventsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfEventsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
