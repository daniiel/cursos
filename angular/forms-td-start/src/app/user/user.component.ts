import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  user = new FormGroup({
    name: new FormControl(''),
    skills: new FormArray([
      new FormGroup({
        name: new FormControl(''),
        level: new FormControl('')
      })
    ])
  });

  skills = this.user.get('skills') as FormArray;

  constructor() { }

  ngOnInit() {
  }

  // get skills() {
  //   return this.user.get('skills') as FormArray;
  // }


}
