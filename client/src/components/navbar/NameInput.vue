<template>
  <b-form-input v-model="map"
    type="text"
    placeholder="Server Name"
    @input="loadname"></b-form-input>
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  data () {
    return {
      name: ''
    }
  },
  methods: {
    loadname (name) {
      eventBus.$emit('updatename', name)
    }
  }
}
</script>
