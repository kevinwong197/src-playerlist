<template>
  <div class="row py-3 py-md-1">
    <div class="name col-12 col-xs-8 col-md-8 col-lg-8">{{player.name}}</div>
    <div class="score col-6 col-xs-2 col-md-2 col-lg-2">{{player.score}}</div>
    <div class="time col-6 col-xs-2 col-md-2 col-lg-2">{{player.time}}</div>
  </div>
</template>

<script>

export default {
  props: ['player'],
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
@media (min-width: 544px) {
  .name {
    font-size: 1.2rem;
  }
  .score, .time {
    font-size: 1rem;
  }
}
/* Medium devices (tablets, 768px and up) The navbar toggle appears at this breakpoint */
@media (min-width: 768px) {
  .name, .score, .time {
    text-align: left;
    font-size: 0.6rem;
  }
}
/* Large devices (desktops, 992px and up) */
@media (min-width: 992px) {
  .name, .score, .time {
    text-align: left;
    font-size: 0.8rem;
  }
}
/* Extra large devices (large desktops, 1200px and up) */
@media (min-width: 1200px) {
  .name, .score, .time {
    text-align: left;
    font-size: 1rem;
  }
}
</style>
