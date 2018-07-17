<template>
  <input type="text"
    class="form-control"
    placeholder="map"
    @keyup.native.enter="loadmap('ctf_2fort')">
</template>

<script>
import eventBus from '@/services/eventBus.js'

export default {
  methods: {
    loadmap (map) {
      eventBus.$emit('updatemap', map)
      eventBus.$emit('getservers')
    }
  }
}
</script>
