<template>
  <nav class="top-nav navbar navbar-expand-lg navbar-light" style="background-color: #1d1d1d;">
    <div class="container-fluid">
      <router-link v-if="courses.length" :to="{ name: 'welcome' }" class="navbar-brand">
        <img :src="brandImg" class="brand">
      </router-link>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <div class="col-12 col-md-3">
          <ul class="navbar-nav">
            <!--
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="browseDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Browse
              </a>
              <div class="dropdown-menu" aria-labelledby="browseDropdown" v-for="course in courses">
                <router-link :to="{ name: 'courses', params: { course_id: course.id }, query: { course_id: course.id } }" class="dropdown-item">{{course.attributes.name}}</router-link>
              </div>
            </li>
            <li class="nav-item">
              <router-link :to="{ name: 'home'}" class="nav-link"> Workshops </router-link>
            </li>
            -->
          </ul>
        </div>

        <div class="col-12 col-md-5">
          <ul class="navbar-nav">
            <!--
            <div class="input-group">
              <span class="input-group-append bg-white">
                <span class="input-group-text bg-transparent">
                  <img :src="searchIcon" class="search-icon">
                </span>
              </span>
              <input class="form-control border-left-none shadow-none" type="search" placeholder="What do you want to learn today" aria-label="Search">
            </div>
            -->
          </ul>
        </div>

        <div class="col-12 col-md-4">
          <ul class="navbar-nav navbar-right justify-content-end">
            <li class="nav-item my-auto">
              <router-link v-if="courses.length"
                :to="{ name: 'courses', params: { course_id: courses[0].id, section_id:  storedSectionIndex } }" class="nav-link"> My Course
              </router-link>
            </li>
            <li class="nav-item my-auto" v-if="courses.length">
              <router-link :to="{ name: 'classmates', params: { id: courses[0].id, course: JSON.stringify(courses[0]) } }" class="nav-link">My Classmates</router-link>
            </li>
            <!--
            <li class="nav-item">
              <router-link to="/" class="nav-link">
                <div class="notification">
                  <svg id="Large_Preview" data-name="Large Preview" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 37.5 34.04">
                    <line class="cls-1" x1="9.81" y1="11.54" x2="9.81" y2="13.23"/>
                    <path class="cls-2" d="M19.12,31V29.31c-2-1.49-2.54-3.39-2.54-5.93V20A6.77,6.77,0,0,0,3,20v2.54c0,2.54-.51,5.28-2.54,6.77V31Z"/>
                    <path class="cls-2" d="M12.35,31.85c0,.93-1.14,1.69-2.54,1.69s-2.54-.76-2.54-1.69"/>
                    <circle class="cls-3" cx="26.23" cy="11.27" r="11.27"/>
                    <path class="cls-4" d="M23.49,15.66a2.83,2.83,0,0,1-1-2.18,2.41,2.41,0,0,1,.67-1.71A3.15,3.15,0,0,1,24.45,11a2.56,2.56,0,0,1-.92-.61,2.14,2.14,0,0,1-.61-1.59A2.53,2.53,0,0,1,23.65,7,3.47,3.47,0,0,1,26.25,6,3.41,3.41,0,0,1,28.81,7a2.53,2.53,0,0,1,.74,1.86,2.15,2.15,0,0,1-.62,1.59A2.53,2.53,0,0,1,28,11a3.18,3.18,0,0,1,1.24.75,2.41,2.41,0,0,1,.68,1.71,2.87,2.87,0,0,1-1,2.18,3.74,3.74,0,0,1-2.76.84A3.71,3.71,0,0,1,23.49,15.66Zm1.77-3.35a1.5,1.5,0,0,0-.39,1,1.41,1.41,0,0,0,.39,1,1.44,1.44,0,0,0,1,.36,1.47,1.47,0,0,0,1-.36,1.44,1.44,0,0,0,.39-1,1.36,1.36,0,0,0-.39-1,1.44,1.44,0,0,0-1-.36A1.34,1.34,0,0,0,25.26,12.31Zm.09-4.23a1.13,1.13,0,0,0-.38.86,1.1,1.1,0,0,0,.38.85,1.29,1.29,0,0,0,.88.33,1.2,1.2,0,0,0,.87-.33,1.09,1.09,0,0,0,.38-.85,1.13,1.13,0,0,0-.38-.87,1.33,1.33,0,0,0-.87-.32A1.28,1.28,0,0,0,25.35,8.08Z"/>
                  </svg>
                </div>
              </router-link>
            </li>
            -->

            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="accountDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img :src="imageUrl" class="rounded-circle user-icon">
              </a>

              <div class="dropdown-menu account-box" aria-labelledby="accountDropdown">
                <router-link to="/account" class="dropdown-item"> Account </router-link>
                <div class="dropdown-divider"></div>
                <a class='dropdown-item' href='/users/sign_out' data-method="delete"> Logout </a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
import brandImg from 'images/brand.png'
import defaultAvatar from 'images/default-avatar.png'
import searchIcon from 'images/search.png'

import { mapState } from 'vuex'

export default {
  props: {
    courses: Array,
    storedSectionIndex: Number,
  },

  data: function () {
    return {
      brandImg: brandImg,
      defaultAvatar: defaultAvatar,
      searchIcon: searchIcon,
    }
  },

  computed: {
    ...mapState(['currentUser']),

    imageUrl() {
      return this.currentUser.image_url || this.defaultAvatar;
    },
  },
}
</script>

<style scoped lang="scss">
.top-nav {

  .cls-1,.cls-2 {
    fill:none;
    stroke:#fff;
  }

  .cls-1 {
    stroke-linecap:round;
    stroke-miterlimit:10;
  }

  .cls-2 {
    stroke-linejoin:round;
  }

  .cls-3 {
    fill:#8ac541;
  }

  .cls-4{
    fill:#231f20;
  }

  .navbar-brand {
    color: white;
  }

  .navbar-nav li > a {
    color: white !important;
    font-size: 18px;
  }
  .form-control {
    border-radius: 0;
    border: none;
  }

  .brand {
    height: 25px;
  }

  .search-icon {
    width: 15px;
    height: 15px;
  }

  .input-group-text {
    border-radius: 0;
    border: 0;
    padding: 0.8rem 1rem;
  }
  .user-icon {
    width: 33px;
    height: 33px;
  }

  .notification {
    width: 35px;
    height: 33px;
  }

  .navbar-toggler {
    background-color: white;
  }

  ul > li > a:hover {
    background-color: white;
    color: black !important;

    line.cls-1, svg .cls-2 {
      stroke: #000;
    }
  }

  .dropdown-menu {
    min-width: 8rem;
  }

  .dropdown-menu.account-box {
    right: 0;
    left: unset;
  }
}

</style>
