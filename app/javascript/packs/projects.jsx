import React from 'react'
import ReactDOM from 'react-dom'

const root = document.querySelector('#root')
const props = JSON.parse(root.dataset.props)
console.log("props", props)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Projects {...props} />, root)
})

const Projects = ({ data }) => (
  <div>
    <h1>Projects</h1>
    {data.projects.map(({ id, ...props }) => (
      <Project key={id} {...props} />
    ))}
    <hr />
  </div>
)

const Project = ({ title, slides }) => (
  <div>
    <h2>{title}</h2>
    {slides.map(s => (
      <span key={s.id}>{s.id} </span>
    ))}
  </div>
)
