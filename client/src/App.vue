<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
body {
  background-color: #111111;
}
#app {
  color: #c58;
  font-family: rr, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  margin-top: 0rem;
}
@font-face {
  font-family: rr;
  font-weight: 300;
  src: url('assets/fonts/Folks-Bold.ttf') format('truetype');
}
@media (min-width: 544px) {
  #app {
    margin-top: 2rem;
  }
}
</style>
