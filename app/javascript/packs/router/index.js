import { createWebHistory, createRouter } from "vue-router";
import Home from '../../components/home/Home.vue';

import Welcome from '../../components/home/Welcome.vue';
import Course from '../../components/home/Course.vue';
import ClassRoom from '../../components/home/ClassRoom.vue';
import Account from '../../components/home/Account.vue';
import Billing from '../../components/home/Billing.vue';

import Onboard from '../../components/onboard/Onboard.vue';
import Checkout from '../../components/checkout/Checkout.vue';
import SignUp from '../../components/sign_up/SignUp.vue';

const routes = [

  {
    path: '/',
    name: 'home',
    component: Home,
    children: [
      {
        path: '',
        name: 'welcome',
        component: Welcome,
      },
      {
        path: 'courses/:course_id/sections/:section_id',
        name: 'courses',
        component: Course,
      },
      {
        path: 'courses/:id/classmates',
        name: 'classmates',
        component: ClassRoom,
      },
      {
        path: 'account',
        name: 'account',
        component: Account,
      },
      {
        path: 'billing',
        name: 'billing',
        component: Billing,
      },
    ]
  },

  {
    path: '/onboard',
    name: 'onboard',
    component: Onboard,
  },

  {
    path: '/checkout',
    name: 'checkout',
    component: Checkout,
  },

  {
    path: '/sign_up',
    name: 'sign_up',
    component: SignUp,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;