import { createWebHistory, createRouter } from "vue-router";
import Home from '../../components/home/Home.vue';
import Course from '../../components/home/Course.vue';
import ClassRoom from '../../components/home/ClassRoom.vue';

import Onboard from '../../components/onboard/Onboard.vue';
import Checkout from '../../components/checkout/Checkout.vue';


const routes = [

  {
    path: "/",
    name: "home",
    component: Home,
    children: [
      {
        path: "/courses",
        name: "courses",
        component: Course,
      },
      {
        path: "/classroom",
        name: "classroom",
        component: ClassRoom,
      },
    ]
  },

  {
    path: "/onboard",
    name: "onboard",
    component: Onboard,
  },

  {
    path: "/checkout",
    name: "checkout",
    component: Checkout,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;