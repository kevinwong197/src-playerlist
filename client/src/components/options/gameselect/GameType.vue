<template>
  <b-dd-item
    href="#"
    :to="api_call()">{{name}}
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
    api_call () {
      return '/' + this.dirname + '/' + this.name
    }
  }
}
</script>
