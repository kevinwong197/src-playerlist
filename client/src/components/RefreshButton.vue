<template>
  <button class="btn btn-primary my-0" v-on:click="search">REFRESH</button>
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
