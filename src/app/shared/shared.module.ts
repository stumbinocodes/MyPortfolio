import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {MaterialModule} from './material.module';

const importedExportedModules = [
  MaterialModule
];

@NgModule({
  imports: [
    CommonModule,
    ...importedExportedModules
  ],
  declarations: [],
  exports: [
    ...importedExportedModules
  ]
})

export class SharedModule {
}
