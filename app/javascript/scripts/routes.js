import { post, postList, postForm } from '../components/posts'

export const ROUTES = [
  { path: '/', component: postList },
  { path: '/posts/new', component: postForm },
  { path: '/posts/:id', component: post }
]
