/**
 * Titik masuk aplikasi. Mendaftarkan komponen akar ke React Native.
 * Nama komponen (app.json "name") wajib sama dengan nama modul di proyek native.
 */
import { AppRegistry } from 'react-native';

import { name as appName } from './app.json';
import { App } from './src/app/App';
import { bootstrapApp } from './src/app/bootstrap';

bootstrapApp();
AppRegistry.registerComponent(appName, () => App);
