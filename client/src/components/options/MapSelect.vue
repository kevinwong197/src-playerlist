<template>
  <b-form-input v-model="map"
    type="text"
    placeholder="Enter Map Name"></b-form-input>
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  data () {
    return {
      map: ''
    }
  },
  methods: {
    loadmap (map) {
      eventBus.$emit('updatemap', map)
      eventBus.$emit('getservers')
    }
  }
}
</script>
