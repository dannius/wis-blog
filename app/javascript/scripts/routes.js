import { post, postList } from '../components/posts'

export const ROUTES = [
  { path: '/', component: postList },
  { path: '/post/:id', component: post }
]