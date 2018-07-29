<template>
    <b-card
      class="text-left nohighlight"
      @click="select"
      :bg-variant="selected ? 'dark' : null"
      header-text-variant="white"
      :header-bg-variant="server.dedicated ? 'primary' : 'secondary'">
      <b-badge :variant="selected ? 'light' : 'dark'" class="d-none d-md-inline-block">
        {{server.players}}/{{server.max_players}}
      </b-badge>
      <h5 class="d-block d-md-inline-block font-weight-bold servertitle">{{server.name}}</h5>
      <b-badge :variant="selected ? 'light' : 'dark'" class="d-md-none">
        {{server.players}}/{{server.max_players}}
      </b-badge>
      <p class="card-text mb-0 mb-md-2 d-inline-block float-none float-md-right" >
        {{server.map}}
      </p>
      <span class="clearfix"/>
      <div class="d-none d-md-block" @click.stop>
        <b-btn size="md"
          class="d-block"
          :href="steamproto(server.addr)"
          :variant="server.dedicated ? 'primary' : 'secondary'"
          :class="{disabled: !server.dedicated}">
          <small>{{server.dedicated ? '↪' : ''}} {{server.addr}}</small>
        </b-btn>
      </div>
      <span @click.stop>
        <players
          v-if="selected"
          :addr="server.addr"
          :parent="$el"
          class="mt-2"/>
      </span>
    </b-card>
</template>

<script>
import eventBus from '@/services/eventBus'
import Players from '@/components/Players'

export default {
  data () {
    return {
      selected: false
    }
  },
  props: ['server'],
  created () {
    eventBus.$on('deselect', this.deselect)
  },
  beforeDestroy(){
    eventBus.$off('deselect', this.deselect)
  },
  methods: {
    select () {
      if (this.selected) {
        eventBus.$emit('refreshplayers')
      } else {
        eventBus.$emit('deselect')
        this.selected = true
      }
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
  },
  components: {
    Players
  }
}
</script>

<style scoped>
.nohighlight {
  -moz-user-select: none;
  -webkit-user-select: none;
  -ms-user-select: none;
  -o-user-select: none;
  user-select: none;    
}
.servertitle {
  border-bottom-width: 2px;
  border-bottom-color: orange;
  border-bottom-style: dashed;
}
</style>
