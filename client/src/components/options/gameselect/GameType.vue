<template>
  <a class="dropdown-item" href="#" @click="loadgame">{{name}}</a>
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  props: [
    'name',
    'dirname'
  ],
  methods: {
    loadgame () {
      eventBus.$emit('updategamelabel', this.name)
      eventBus.$emit('updategame', this.dirname)
      eventBus.$emit('getservers')
    }
  }
}
</script>
