<template>
  <b-dd-item
    href="#"
    :to="'/' + dirname + '/' + name"
    @click.native="loadgame">{{name}}
  </b-dd-item>
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
