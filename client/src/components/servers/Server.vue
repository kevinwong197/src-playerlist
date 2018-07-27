<template>
    <b-card
      header-text-variant="white"
      border-variant="error"
      :header-bg-variant="server.dedicated ? 'primary' : 'secondary'"
      
      class="servercard"
      :title="server.name"
      :class="{highlighted: selected, unhighlighted: unselected}"
      @click="select">

      <div slot="header">
        <small>{{server.addr}}</small>
      </div>

      <p class="card-text">
        {{server.map}}
      </p>

      <b-btn class="desktop" slot="footer" :href="steamproto(server.addr)">
        {{server.dedicated ? 'connect' : 'local'}}
        <b-badge variant="light">{{server.players}}/{{server.max_players}}</b-badge>
      </b-btn>
    </b-card>
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
.desktop {
  display: none;
}
.servercard {
  cursor: pointer;
}
.name {
  text-align: center;
  font-size: 1rem;
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
  .name, .map, .players, .addr, .btn, .badge {
    font-size: 0.6rem;
  }
}
/* Large devices (desktops, 992px and up) */
@media (min-width: 992px) {
  .name, .map, .players, .addr, .btn, .badge {
    font-size: 0.8rem;
  }
}
/* Extra large devices (large desktops, 1200px and up) */
@media (min-width: 1200px) {
  .name, .map, .players, .addr, .btn, .badge {
    font-size: 1rem;
  }
}
</style>
