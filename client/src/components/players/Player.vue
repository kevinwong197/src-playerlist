<template>
  <div class="row py-3 py-md-1" @click="searchSteam">
    <div class="name col-12 col-xs-8">{{player.name}}</div>
    <div class="score col-6 col-xs-2">{{player.score}}</div>
    <div class="time col-6 col-xs-2">{{player.time}}</div>
  </div>
</template>

<script>

export default {
  props: ['player'],
  methods: {
    searchSteam() {
      window.open(`https://steamcommunity.com/search/users#text=${this.player.name}`)
    }
  }
}
</script>

<style scoped>
.row {
  cursor: pointer;
}
.row:hover {
  background-color: #333333;
}
.name {
  text-align: center;
  font-size: 1rem;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
.score {
  text-align: left;
  font-size: 0.8rem;
}
.time {
  text-align: right;
  font-size: 0.8rem;
}
</style>
