<template>
    <b-card
      class="text-left nohighlight"
      @click="select"
      :bg-variant="selected ? 'dark' : null"
      header-text-variant="white"
      :header-bg-variant="server.dedicated ? 'primary' : 'secondary'"
      :title="server.name">
      <p class="card-text mb-0 mb-md-3">
        <b-badge :variant="selected ? 'light' : 'dark'">
          {{server.players}}/{{server.max_players}}
        </b-badge>
        {{server.map}}
      </p>
      <div class="desktop" @click.stop>
        <b-btn
          class="d-block"
          :href="steamproto(server.addr)"
          :variant="server.dedicated ? 'success' : 'secondary'"
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
.desktop {
  display: none;
}
@media (min-width: 768px) {
  .desktop {
    display: unset;
  }
}
</style>
