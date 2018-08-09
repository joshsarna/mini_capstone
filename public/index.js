/* global Vue, VueRouter, axios */

var Cart = {
  template: "#cart",
  data: function() {
    return {
      message: "Care to donate?",
      cartedProducts: []
    };
  },
  created: function() {
    axios.get('/api/carted_products').then(function(response) {
      this.cartedProducts = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: []
    };
  },
  created: function() {
    axios.get('/api/products').then(function(response) {
      this.products = response.data;
      console.log(response.data);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/cart", component: Cart }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});