import { createStore } from "vuex" 

const store = createStore({
  state: {
    currentUser: null,
    address: {},
    userSettings: {
      businessStatus: -1,
      biggestChallenge: -1,
    },
    concerns: [false, false, false, false, false, false]
  },

  getters: {
    getCurrentUser(state) {
      return state.currentUser;
    },

    getAddress(state) {
      return state.address;
    },

    getBusinessStatus(state) {
      return state.userSettings.businessStatus;
    },

    getBiggestChallenge(state) {
      return state.userSettings.biggestChallenge;
    },

    getConcerns(state) {
      return state.concerns;
    },

  },

  mutations: {
    SET_CURRENT_USER(state, data) {
      state.currentUser = data;
    },

    UNSET_CURRENT_USER(state) {
      state.currentUser = null;
    },

    SET_ADDRESS(state, address) {
      state.address = address;
    },

    SET_BUSINESS_STATUS(state, status) {
      state.userSettings.businessStatus = status;
    },

    SET_BIGGEST_CHALLENGE(state, challenge) {
      state.userSettings.biggestChallenge = challenge;
    },

    SET_CONCERNS(state, index) {
      state.concerns[index] = !state.concerns[index];

      if(state.concerns[state.concerns.length -1] == true){
        state.concerns = [false, false, false, false, false, true];
      }
    },

  },

  actions: {
    setCurrentUser({ commit }, currentUser) {
      commit("SET_CURRENT_USER", currentUser);
    },

    setAddress({ commit }, address) {
      commit("SET_ADDRESS", address);
    },

    setBusinessStatus({ commit }, status) {
      commit("SET_BUSINESS_STATUS", status);
    },

    setBiggestChallenge({ commit }, challenge) {
      commit("SET_BIGGEST_CHALLENGE", challenge);
    },

    setConcerns({ commit }, index) {
      commit("SET_CONCERNS", index);
    }
  }
})

export default store