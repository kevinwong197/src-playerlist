<template>
  <b-button variant="dark" @click="search">
    <slot></slot>
  </b-button>
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  methods: {
    search () {
      eventBus.$emit('getservers')
    }
  }
}
</script>

<style scoped>
</style>
