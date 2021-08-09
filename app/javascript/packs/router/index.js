import { createWebHistory, createRouter } from "vue-router";
import Course from '../../components/home/Course.vue';
import ClassRoom from '../../components/home/ClassRoom.vue';

const routes = [

  // {
  //   path: "/",
  //   name: "home",
  //   component: Course,
  // },

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
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;