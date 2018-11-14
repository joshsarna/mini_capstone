/* global Vue, VueRouter, axios */
var EditPage = {
  template: "#edit-page",
  data: function() {
    return {
      title: "",
      author: "",
      price: "",
      format: "",
      condition: "",
      supplierId: "",
      errors: []
    };
  },
  created: function() {
    console.log(this.$route.params.id);
    axios.get("/api/products/" + this.$route.params.id).then(function(response) {
      console.log(response.data);
      this.title = response.data.title;
      this.author = response.data.author;
      this.price = response.data.price;
      this.format = response.data.format;
      this.condition = response.data.condition;
      this.supplierId = response.data.formatted.supplier.id;
    }.bind(this));
  },
  methods: {
    saveChanges: function() {
      var params = {
        input_name: this.title,
        input_author: this.author,
        input_price: this.price,
        input_format: this.this,
        input_condition: this.condition,
        input_supplier_id: this.supplierId
      };
      axios
        .patch("/api/products/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var Product = {
  template: "#product",
  data: function() {
    return {
      message: "Product",
      product: {},
      quantity: 0
    };
  },
  created: function() {
    console.log(this.$route.params.id);
    axios.get("/api/products/" + this.$route.params.id).then(function(response) {
      console.log(response.data);
      this.product = response.data;
    }.bind(this));
  },
  methods: {
    addToCart: function() {
      var params = {
        quantity: this.quantity,
        product_id: this.product.id
      };
      axios.post("/api/carted_products", params).then(function(response) {
        console.log("booyah, added to cart.");
        router.push("/cart");
      });
    }
  },
  computed: {}
};

var Orders = {
  template: "#orders",
  data: function() {
    return {
      message: "Orders",
      orders: []
    };
  },
  created: function() {
    axios.get('/api/orders').then(function(response) {
      this.orders = response.data;
      console.log(response.data);
    }.bind(this));
  },
  methods: {
    purchase: function() {
      console.log("purchasing?");
      axios.post('/api/orders').then(function(response) {
        console.log("purchased?");
        console.log(response.data);
        router.push("/cart");
      });
    }
  },
  computed: {}
};

var NewProduct = {
  template: "#new-page",
  data: function() {
    return {
      title: "",
      author: "",
      price: "",
      format: "",
      condition: "",
      supplierId: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        input_name: this.title,
        input_author: this.author,
        input_price: this.price,
        input_format: this.this,
        input_condition: this.condition,
        input_supplier_id: this.supplierId
      };
      axios
        .post("/api/products", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var Cart = {
  template: "#cart",
  data: function() {
    return {
      message: "No One Ever Said Anything Bad about Impulse Buys",
      cartedProducts: []
    };
  },
  created: function() {
    axios.get('/api/carted_products').then(function(response) {
      this.cartedProducts = response.data;
    }.bind(this));
  },
  methods: {
    purchase: function() {
      console.log("purchasing?");
      axios.post('/api/orders').then(function(response) {
        console.log("purchased?");
        console.log(response.data);
        router.push("/cart");
      });
    }
  },
  computed: {}
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: [],
      filterSearch: "",
      orderAttribute: "title",
      sortAsc: 1,
      sortIconTitle: "",
      sortIconAuthor: ""
    };
  },
  created: function() {
    axios.get('/api/products').then(function(response) {
      this.products = response.data;
      console.log(response.data);
    }.bind(this));
  },
  methods: {
    sortBy: function(attribute) {
      if (this.orderAttribute !== attribute) {
        this.orderAttribute = attribute;
        this.sortAsc = 1;
        if (this.sortIconAuthor === "") {
          this.sortIconAuthor = "^";
          this.sortIconTitle = "";
        } else if (this.sortIconTitle === "") {
          this.sortIconTitle = "^";
          this.sortIconAuthor = "";
        }
      } else {
        this.sortAsc *= -1;
        if (this.sortIconAuthor === "v") {
          this.sortIconAuthor = "^";
        } else if (this.sortIconAuthor === "^") {
          this.sortIconAuthor = "v";
        } else if (this.sortIconTitle === "v") {
          this.sortIconTitle = "^";
        } else if (this.sortIconTitle === "^") {
          this.sortIconTitle = "v";
        } else if (this.sortIconTitle === "") {
          this.sortIconTitle = "v";
        }
      }
    }
  },
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/products", component: HomePage },
    { path: "/cart", component: Cart },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/new", component: NewProduct },
    { path: "/orders", component: Orders },
    { path: "/products/:id", component: Product },
    { path: "/products/:id/edit", component: EditPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});