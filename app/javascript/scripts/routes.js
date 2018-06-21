import { post, postList, postForm } from '../components/posts'
import { userSettings } from '../components/user-settings'

export const ROUTES = [
  { path: '/', component: postList },
  { path: '/posts/new', component: postForm },
  { path: '/posts/:id', component: post },
  { path: '/settings', component: userSettings }
]
