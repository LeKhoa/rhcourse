<template>
  <div id="classroom">
    <div class="container py-4 px-5">
      <div class="personal row align-items-center justify-content-between">
        <form enctype="multipart/form-data">
          <h1 class="text-center"> Manage your account </h1>
    
          <div class="col-10 col-sm-5 col-md-3 text-center mx-auto mt-5">
            <div class="avatar">
              <img :src="imageUrl" class="w-100 h-100 rounded-circle">
            </div>
            <div class="row mx-auto mt-4">
              <input type="file" ref="inputFile" accept="image/png, image/jpeg, image/jpg" @change="setImage">
            </div>
          </div>

          <div class="row">
            <div v-if="error" class="text-danger mt-3 sub-title text-center"> {{error}} </div>

            <div class="col-12 col-md-6 mt-5">
              <div class="row mt-3 align-items-center">
                <div class="col-3">
                  <label> Email: </label>
                </div>
                <div class="col-9">
                  <input v-model="email" class="form-control rounded-0 shadow-none" />
                </div>
              </div>

              <div class="row mt-3 align-items-center">
                <div class="col-3">
                  <label> Name: </label>
                </div>
                <div class="col-9">
                  <input v-model="name" class="form-control rounded-0 shadow-none"/>
                </div>
              </div>

              <div class="row mt-3 align-items-center">
                <div class="col-3">
                  <label> Phone: </label>
                </div>
                <div class="col-9">
                  <input v-model="phone" class="form-control rounded-0 shadow-none"/>
                </div>
              </div>
              <div class="row mt-4 justify-content-center">
                <div class="col-10 col-sm-8 col-xl-4">
                  <button class="btn btn-dark rounded-0 w-100" @click="updateAccount"> Update </button> 
                </div>
              </div>
            </div>

            <!-- Password -->
            <div class="col-12 col-md-6 mt-5 float-end">
              <div class="row mt-3 align-items-center">
                <div class="col-5 text-end">
                  <label> Current Password: </label>
                </div>
                <div class="col-7">
                  <input v-model="currentPassword" class="form-control rounded-0 shadow-none"/>
                </div>
              </div>
              <div class="row mt-3 align-items-center">
                <div class="col-5 text-end">
                  <label> Password: </label>
                </div>
                <div class="col-7">
                  <input v-model="password" class="form-control rounded-0 shadow-none"/>
                </div>
              </div>

              <div class="row mt-3 align-items-center">
                <div class="col-5 text-end">
                  <label> Password Confirmation: </label>
                </div>
                <div class="col-7">
                  <input v-model="passwordConfirmation" class="form-control rounded-0 shadow-none"/>
                </div>
              </div>

              <div class="row mt-4 justify-content-center">
                <div class="col-10 col-sm-8 col-xl-4">
                  <button class="btn btn-dark rounded-0 w-100" @click="changePassword"> Change Password </button> 
                </div>
              </div>
            </div>
            <!-- end password -->
          </div>
        </form>
      </div>
      <hr>    
    </div>
  </div>
</template>

<script>

import Header from '../home/Header.vue'
import defaultAvatar from 'images/default-avatar.png'
import fbImg from 'images/fb.png'
import callImg from 'images/call.png'

import { mapState, mapActions } from 'vuex'

export default {
  components: {
    Header,
  },


  data: function () {
    return {
      fbImg: fbImg,
      callImg: callImg,
      defaultAvatar: defaultAvatar,

      name: '',
      email: '',
      phone: '',
      imageFile: null,

      currentPassword: '',
      password: '',
      passwordConfirmation: '',
      error: '',
    }
  },

  methods: {
    ...mapActions(['setCurrentUser']),

    setImage(e) {
      this.imageFile = e.target.files[0];
    },

    updateAccount(e) {
      e.preventDefault();
      this.clearError();
  
      let formData = new FormData();
      formData.append('user[name]', this.name);
      formData.append('user[email]', this.email);
      formData.append('user[phone]', this.phone);
      if (this.imageFile !== null) {
        formData.append('user[image]', this.imageFile);
      }

      this.$http.put(`/users/${this.currentUser.id}`, formData)
        .then(response => {
          this.updateAccountSuccessfull(response)
        }).catch(error => {
          this.error = error.response.data.message;
      });
    },

    changePassword(e) {
      e.preventDefault();
      this.clearError();

      let params = {
        user: {
          current_password: this.currentPassword,
          password: this.password,
          password_confirmation: this.passwordConfirmation,
        }
      }
      this.$http.put(`/users/${this.currentUser.id}/change_password`, params)
        .then(response => {
          console.log(response.data);
        }).catch(error => {
          this.error = error.response.data.message;
      });
    },

    updateAccountSuccessfull(response) {
      this.setCurrentUser(response.data.user)
      this.setUserData();
    },

    setUserData() {
      this.name = this.currentUser.name;
      this.email = this.currentUser.email;
      this.phone = this.currentUser.phone;
    },

    clearError() {
      this.error = '';
    }

  },

  computed: {
    ...mapState(['currentUser']),

    imageUrl() {
      return this.currentUser.image_url || this.defaultAvatar;
    }
  },

  mounted() {
    this.setUserData();
  },
}
</script>

<style scoped>
  .title {
    font-size: 35px;
  }

  .sub-title {
    font-size: 25px;
  }

  .avatar {
    width: 200px;
    height: 200px;
  }

</style>
