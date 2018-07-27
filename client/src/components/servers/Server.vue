<template>
    <b-card
      class="text-left"
      @click="select"
      :bg-variant="selected ? 'dark clicked' : null"
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
      <players
        v-if="selected"
        :addr="server.addr"
        class="mt-2"/>
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
    eventBus.$on('deselect', (addr) => {
      this.deselect(addr)
    })
  },
  beforeDestroy(){
    eventBus.$off('deselect', (addr) => {
      this.deselect(addr)
    })
  },
  methods: {
    select () {
      if (this.selected) {
        eventBus.$emit('refreshplayers')
      } else {
        this.selected = true
        eventBus.$emit('deselect', this.server.addr)
      }
      console.log('clicked: '+this.server.addr)
    },
    deselect (addr) {
      if (addr === this.server.addr) {
        return
      }
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
.desktop {
  display: none;
}
@media (min-width: 768px) {
  .desktop {
    display: unset;
  }
}
</style>
