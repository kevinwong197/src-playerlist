<template>
  <input type="text"
    class="form-control"
    placeholder="Map"
    @keyup.native.enter="loadmap('ctf_2fort')">
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  methods: {
    loadmap (map) {
      eventBus.$emit('updatemap', map)
      eventBus.$emit('getservers')
    }
  }
}
</script>
