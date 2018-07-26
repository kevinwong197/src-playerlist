<template>
  <b-button variant="primary" @click="search">REFRESH</b-button>
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
