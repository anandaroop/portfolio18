import React from 'react'
import ReactDOM from 'react-dom'

const root = document.querySelector('#root')
const props = JSON.parse(root.dataset.props)

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
      <img
        key={s.id}
        src={s.image.smallUrl}
        style={{ maxWidth: '170px', maxHeight: '170px', marginRight: '1em' }}
      />
    ))}
  </div>
)
