import { createStore } from "vuex" 

const store = createStore({
  state: {
    currentUser: null,
    address: {},
    userSettings: {
      businessStatus: -1,
      challenges: [false, false, false, false, false, false],
      concerns: [false, false, false, false, false, false],
      criterias: [false, false, false, false],
    },
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

    getChallenges(state) {
      return state.userSettings.challenges;
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

    SET_CHALLENGES(state, index) {
      state.userSettings.challenges[index] = !state.userSettings.challenges[index];
    },

    SET_CONCERNS(state, index) {
      state.userSettings.concerns[index] = !state.userSettings.concerns[index];

      if(state.userSettings.concerns[state.userSettings.concerns.length -1] == true){
        state.userSettings.concerns = [false, false, false, false, false, true];
      }
    },

    SET_CRITERIAS(state, index) {
      state.userSettings.criterias[index] = !state.userSettings.criterias[index];
    }
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

    setChallenges({ commit }, index) {
      commit("SET_CHALLENGES", index);
    },

    setConcerns({ commit }, index) {
      commit("SET_CONCERNS", index);
    },

    setCriterias({ commit }, index) {
      commit("SET_CRITERIAS", index);
    }
  }
})

export default store