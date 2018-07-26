<template>
  <b-dd-item
    href="#"
    :to="'/' + dirname + '/' + name">{{name}}
  </b-dd-item>
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  props: [
    'name',
    'dirname'
  ]
}
</script>
