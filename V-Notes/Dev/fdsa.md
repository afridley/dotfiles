```ts
import { Button, Heading } from 'pds-ui'
import React from 'react'

interface ICard {
  title: string,
  action?: {
    title: string,
    onClick: () => void
  }
  children: React.ReactNode
}

const Card: React.FC<ICard> = ({ title, action, children }) => {
  return (
    <div className="mb-4 w-full border border-surface-line">
      <div className="border-b border-b-surface-line p-5">
        <Heading as="h2" size="titleMedium" weight="heavy">{title}</Heading>
        {action && (
          <Button onClick={action.onClick}>{action.title}</Button>
        )}
      </div>
      {children}
    </div>
  )
}

export default Card

```