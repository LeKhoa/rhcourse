<template>
  <div id="classroom">
    <div class="container py-4 px-5">
      <div class="personal row align-items-center justify-content-between">
        <form enctype="multipart/form-data" @submit.prevent>
          <h1 class="text-center"> Manage your account </h1>
    
          <div class="col-10 col-sm-5 col-md-3 text-center mx-auto mt-5">
            <div class="avatar mx-auto">
              <img :src="imageUrl" class="w-100 h-100 rounded-circle">
            </div>
            <div class="row mx-auto mt-4">
              <input type="file" ref="inputFile" accept="image/png, image/jpeg, image/jpg" @change="setImage">
            </div>
          </div>

          <div class="row">
            <div v-if="error" class="text-danger mt-3 sub-title text-center"> {{error}} </div>
            <div v-else class="text-success mt-3 sub-title text-center"> {{msg}} </div>

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

            <div class="col-12 col-md-6 mt-5 float-end">
              <div class="row mt-4 justify-content-center">
                <div class="col-10 col-sm-8 col-xl-4">
                  <button class="btn rounded-0 w-100"
                    onclick="window.open('https://convertlabs.io/login','_blank');" >
                    <img :src="clabImg" class="w-100"/>
                  </button>
                </div>
              </div>
              <div class="row mt-3 align-items-center">
                <div class="col-6 text-end">
                  <label> Email: </label>
                </div>
                <div class="col-6">
                  <span class="fw-bold"> {{email}} </span>
                </div>
              </div>
              <div class="row mt-3 align-items-center">
                <div class="col-6 text-end">
                  <label> Password: </label>
                </div>
                <div class="col-6">
                  <span class="fw-bold"> {{password}} </span>
                </div>
              </div>

              <div class="row mt-3 align-items-center">
                <div class="col-6 text-end">
                  <label> Password for Rohan Academy: </label>
                </div>
                <div class="col-6">
                  <span class="fw-bold"> {{password}} </span>
                </div>
              </div>
              <!-- Nerdpilots -->
              <div class="row mt-4 justify-content-center">
                <div class="col-10 col-sm-8 col-xl-4">
                  <button class="btn rounded-0 w-100"
                    onclick="window.open('https://app.nerdpilots.com','_blank');" >
                    <img :src="npilotsImg" class="w-100"/>
                  </button>
                </div>
              </div>
              <div class="row mt-3 align-items-center">
                <div class="col-6 text-end">
                  <label> Email: </label>
                </div>
                <div class="col-6">
                  <span v-if="currentUser.np_account_created" class="fw-bold"> {{email}} </span>
                </div>
              </div>
              <div class="row mt-3 align-items-center">
                <div class="col-6 text-end">
                  <label> Password: </label>
                </div>
                <div class="col-6">
                  <span v-if="currentUser.np_account_created" class="fw-bold"> {{password}} </span>
                </div>
              </div>
              <div class="row mt-3 justify-content-center">
                <div class="col-10 col-sm-8 col-xl-4">
                  <button class="btn btn-dark rounded-0 shadow-none w-100"
                    :class="{ disabled: creatingTask }"
                    @click="getNPilotsSupport"> Get NerdPilots support</button>
                </div>
              </div>
            </div>

            <!-- Change password
            <div class="col-12 col-md-6 mt-5 float-end" v-if="hasPassword">
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
            end password

            Set password
            <div class="col-12 col-md-6 mt-5 float-end" v-else>
              <div class="text-center sub-title text-warning"> Please set your password </div>
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
                  <button class="btn btn-dark rounded-0 w-100" @click="setPassword"> Set Password </button>
                </div>
              </div>
            </div>
            End Set password -->
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
import clabImg from 'images/clab.png'
import npilotsImg from 'images/npilots.png'

import { mapState, mapActions } from 'vuex'

export default {
  components: {
    Header,
  },


  data: function () {
    return {
      defaultAvatar: defaultAvatar,

      name: '',
      email: '',
      phone: '',
      imageFile: null,

      currentPassword: '',
      password: '',
      passwordConfirmation: '',
      error: '',
      msg: '',
      clabImg: clabImg,
      npilotsImg: npilotsImg,
      creatingTask: false,
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

      this.$http.put(`/api/users/${this.currentUser.id}`, formData)
        .then(response => {
          this.msg = 'Update account successfull';
          this.updateAccountSuccessfull(response)
        }).catch(error => {
          this.error = error.response.data.message;
      });
    },

    getNPilotsSupport() {
      this.creatingTask = true;
      this.$http.post(`/api/n_pilots/create_task`)
        .then(response => {
          this.creatingTask = false;
          this.msg = response.data.message;
        }).catch(error => {
          this.creatingTask = false;
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
      this.$http.put(`/api/users/${this.currentUser.id}/change_password`, params)
        .then(response => {
          this.msg = 'Change password successfull'
          this.setCurrentUser(response.data.user);
          this.clearPassword();
        }).catch(error => {
          this.error = error.response.data.message;
      });
    },

    setPassword(e) {
      e.preventDefault();
      this.clearError();
      let params = {
        user: {
          password: this.password,
          password_confirmation: this.passwordConfirmation,
        }
      }

      this.$http.put(`/api/users/${this.currentUser.id}/set_password`, params)
        .then(response => {
          this.msg = 'Set password successfull'
          this.setCurrentUser(response.data.user)
          this.clearPassword();
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
      this.password = this.currentUser.cl_password;
    },

    clearPassword() {
      this.password = '';
      this.currentPassword = '';
      this.passwordConfirmation = '';
    },

    clearError() {
      this.error = '';
      this.msg = '';
    }

  },

  computed: {
    ...mapState(['currentUser']),

    imageUrl() {
      return this.currentUser.image_url || this.defaultAvatar;
    },

    hasPassword() {
      return this.currentUser.has_password
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
