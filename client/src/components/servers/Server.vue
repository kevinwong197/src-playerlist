<template>
  <div class="row py-3 py-md-1"
    v-bind:class="{highlighted: selected, unhighlighted: unselected}"
    v-on:click="select">
    <div class="name col-12 col-md-5">{{server.name}}</div>
    <div class="addr col-md-3">{{server.addr}}</div>
    <div class="map col-6 col-md-3">{{server.map}}</div>
    <div class="players col-6 col-md-1">{{server.players}}/{{server.max_players}}</div>
  </div>
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  data () {
    return {
      selected: false
    }
  },
  props: ['server'],
  mounted () {
    eventBus.$on('deselect', () => {
      this.deselect()
    })
  },
  methods: {
    select () {
      eventBus.$emit('getplayers', this.server.addr)
      eventBus.$emit('deselect')
      this.selected = true
    },
    deselect () {
      this.selected = false
    },
    unselected () {
      return !(this.selected)
    }
  }
}
</script>

<style scoped>
.row {
  cursor: pointer;
}
.name {
  text-align: center;
  font-size: 1rem;
}
.addr {
  display: none;
}
.map {
  text-align: left;
  font-size: 0.8rem;
}
.players {
  text-align: right;
  font-size: 0.8rem;
}
.name, .map {
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
.unhighlighted:hover {
  background-color: #333333;
}
.highlighted {
  background-color: #444444;
}
@media (min-width: 544px) {
  .name {
    font-size: 1.2rem;
  }
  .map, .players {
    font-size: 1rem;
  }
}
/* Medium devices (tablets, 768px and up) The navbar toggle appears at this breakpoint */
@media (min-width: 768px) {
  .addr {
    display: unset;
  }
  .name, .map, .players, .addr {
    text-align: left;
    font-size: 0.6rem;
  }
}
/* Large devices (desktops, 992px and up) */
@media (min-width: 992px) {
  .name, .map, .players, .addr {
    text-align: left;
    font-size: 0.8rem;
  }
}
/* Extra large devices (large desktops, 1200px and up) */
@media (min-width: 1200px) {
  .name, .map, .players, .addr {
    text-align: left;
    font-size: 1rem;
  }
}
</style>
