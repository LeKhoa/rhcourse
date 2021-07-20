import { createApp } from 'vue'
import Onboard from '../components/Onboard.vue'

let app;
document.addEventListener('turbolinks:load', () => {
  app = createApp(Onboard)
  app.mount('#onboard');
});

document.addEventListener('turbolinks:before-render', () => {
  if (app)
    app.unmount();
});
