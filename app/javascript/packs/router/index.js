import { createWebHistory, createRouter } from "vue-router";
import Home from '../../components/home/Home.vue';
import Course from '../../components/home/Course.vue';
import ClassRoom from '../../components/home/ClassRoom.vue';
import Account from '../../components/home/Account.vue';

import Onboard from '../../components/onboard/Onboard.vue';
import Checkout from '../../components/checkout/Checkout.vue';


const routes = [

  {
    path: "/",
    name: "home",
    component: Home,
    children: [
      {
        path: "/courses/:id",
        name: "courses",
        component: Course,
      },
      {
        path: "/classmates",
        name: "classmates",
        component: ClassRoom,
      },
      {
        path: "/account",
        name: "account",
        component: Account,
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