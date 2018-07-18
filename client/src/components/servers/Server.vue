<template>
  <div class="row py-3 py-md-1"
    v-bind:class="{highlighted: selected, unhighlighted: unselected}"
    v-on:click="select">
    <div :class="{'btn-warning': !server.dedicated, 'btn-success': server.dedicated}"
      class="desktop dedi btn disabled col-md-1 py-md-0">
      {{server.dedicated ? 'dedi' : 'local'}}
    </div>
    <div class="name col-12 col-md-4">{{server.name}}</div>
    <div class="desktop addr col-md-3">{{server.addr}}</div>
    <div class="map col-6 col-md-2">{{server.map}}</div>
    <div class="players col-6 col-md-1">{{server.players}}/{{server.max_players}}</div>
    <a class="desktop join btn btn-info col-md-1 py-md-0" :href="steamproto(server.addr)">join</a>
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
    },
    steamproto (addr) {
      return 'steam://connect/' + addr
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
.desktop {
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
  .desktop {
    display: unset;
  }
  .name, .map, .players, .addr {
    text-align: left;    
  }
  .name, .map, .players, .addr, .btn {
    font-size: 0.6rem;
  }
}
/* Large devices (desktops, 992px and up) */
@media (min-width: 992px) {
  .name, .map, .players, .addr, .btn {
    font-size: 0.8rem;
  }
}
/* Extra large devices (large desktops, 1200px and up) */
@media (min-width: 1200px) {
  .name, .map, .players, .addr, .btn {
    font-size: 1rem;
  }
}
</style>
