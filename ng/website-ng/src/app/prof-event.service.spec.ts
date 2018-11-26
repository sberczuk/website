import { TestBed } from '@angular/core/testing';

import { ProfEventService } from './prof-event.service';

describe('ProfEventService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ProfEventService = TestBed.get(ProfEventService);
    expect(service).toBeTruthy();
  });
});
