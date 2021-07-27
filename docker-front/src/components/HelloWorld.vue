<template>
  <v-simple-table>
    <template v-slot:default>
      <thead>
      <tr>
        <th class="text-left">
          ID
        </th>
        <th class="text-left">
          Name
        </th>
      </tr>
      </thead>
      <tbody>
      <tr
        v-for="post in posts"
        :key="post.id"
      >
        <td>{{ post.id }}</td>
        <td>{{ post.name }}</td>
      </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>

<script>
import axios from 'axios'
import {api} from '../main'

export default {
  name: 'HelloWorld',
  data: () => ({
    posts: []
  }),
  created () {
    this.posts = axios.get(`${api}/posts`).then((response) => {
      this.posts = response.data
    })
  }
}
</script>
