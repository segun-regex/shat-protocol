# ShatProtocol - Decentralized Social Protocol Documentation

## Overview

ShatProtocol is a next-generation decentralized social networking protocol built on the Stacks blockchain, leveraging Bitcoin's unmatched security and Stacks' advanced smart contract capabilities. Designed for Web3 social applications, it provides a robust foundation for building censorship-resistant social platforms with enterprise-grade features.

## Key Features

### 1. Identity Management System

- **Self-Sovereign Identities**: Users control their digital identities through Stacks principals
- **Multi-Factor Profile System**:
  - Core profile data storage
  - Cryptographic key management
  - Profile image handling
  - Rich metadata support (UTF-8 compatible)

### 2. Advanced Privacy Framework

- Granular privacy controls with 6 configurable dimensions:
  - Friend list visibility
  - Status visibility
  - Metadata exposure
  - Last-seen timestamp
  - Profile image access
  - End-to-end encryption toggle
- Dynamic privacy settings updatable with rate-limited operations

### 3. Relationship Management

- Multi-state friendship system:
  - Pending → Active → Blocked states
  - Bidirectional relationship tracking
- Blocklist management with timestamped entries
- Privacy-aware friend discovery

### 4. Network Protection System

- Three-tier rate limiting:
  1. Global daily actions (100/day)
  2. Friend requests (20/day)
  3. Status updates (24/day)
- Automatic reset mechanism (24-hour cycles)
- Action-specific counters

### 5. Performance Optimization

- Adaptive batch processing:
  - Dynamic batch size adjustment (10-100 operations)
  - Batch expiration system (1-hour TTL)
  - Automatic size optimization based on usage patterns
- Batch operation metrics tracking

### 6. Activity Monitoring

- Comprehensive user analytics:
  - Last-seen tracking
  - Login counters
  - Total action metrics
  - Temporal activity patterns

## Core Architecture

### Data Model

#### User Profile Structure

```clarity
{
  name: (string-ascii 64),
  status: uint,          // ACTIVE/SUSPENDED/DEACTIVATED
  timestamp: uint,
  metadata: (optional (string-utf8 256)),
  deactivation-time: (optional uint),
  encryption-key: (optional (buff 32)),
  profile-image: (optional (string-utf8 256))
}
```

#### Privacy Settings Schema

```clarity
{
  friend-list-visible: bool,
  status-visible: bool,
  metadata-visible: bool,
  last-seen-visible: bool,
  profile-image-visible: bool,
  encryption-enabled: bool,
  last-updated: uint
}
```

### Security Model

- **Bitcoin Finality**: All operations inherit Bitcoin's proof-of-work security
- **Stacks L2 Benefits**:
  - Smart contract capabilities
  - Microblock transactions
  - Clarity language security guarantees
- **Encryption Ready**: Supports E2EE through shared key management

## Key Functionality

### User Management

- Profile creation/updating with rate limits
- Account status transitions (active/suspended/deactivated)
- Cryptographic identity management

### Social Graph Operations

- Friendship lifecycle management:
  - Request → Accept/Reject → Block
  - State transition validation
- Blocklist management with temporal constraints

### Network Operations

- Adaptive batch processing system:
  - Automatic size optimization
  - Expiration handling
  - Usage-based scaling
- Rate-limited API surface:
  - Action type-specific limits
  - Automatic reset mechanism

## Error Handling System

### Error Codes

| Code | Constant           | Description                  |
| ---- | ------------------ | ---------------------------- |
| u100 | ERR_NOT_FOUND      | Requested resource not found |
| u101 | ERR_ALREADY_EXISTS | Duplicate creation attempt   |
| u102 | ERR_UNAUTHORIZED   | Authorization failure        |
| u103 | ERR_INVALID_INPUT  | Malformed request data       |
| u104 | ERR_BLOCKED        | Blocked user interaction     |
| u105 | ERR_DEACTIVATED    | Account not active           |
| u106 | ERR_RATE_LIMITED   | Rate limit exceeded          |
| u107 | ERR_BATCH_FULL     | Batch capacity exceeded      |
| u108 | ERR_BATCH_EXPIRED  | Stale batch operation        |

## Performance Characteristics

### Rate Limits

| Resource        | Limit | Reset Period |
| --------------- | ----- | ------------ |
| Daily Actions   | 100   | 24 hours     |
| Friend Requests | 20    | 24 hours     |
| Status Updates  | 24    | 24 hours     |

### Batch Processing

| Parameter          | Value       |
| ------------------ | ----------- |
| Minimum Batch Size | 10          |
| Maximum Batch Size | 100         |
| Batch Expiration   | 3600s (1hr) |

## Developer Guide

### Key Functions

#### `update-advanced-privacy-settings`

- Updates user's privacy preferences
- Parameters: 6 boolean flags for privacy features
- Rate limited: Uses status update quota

#### `optimize-batch-size`

- Dynamically adjusts batch operations size
- Automatic call recommended during batch finalization
- Implements exponential backoff/scale-up algorithm

#### `manage-friendship`

- Handles relationship state transitions
- Validates bidirectional blocking status
- Enforces privacy constraints

### Event Logging

Protocol emits structured events for all key operations:

- Profile updates
- Privacy changes
- Batch optimizations
- User logins
- Friendship state changes

## Security Considerations

### Trust Model

- Inherits Bitcoin's proof-of-work security
- No admin keys or backdoors
- Fully decentralized governance

### Audit Recommendations

1. Review rate limit synchronization
2. Validate batch expiration logic
3. Test edge cases in friendship state transitions
4. Verify privacy setting inheritance
5. Check encryption key handling

## Compliance Features

- Stacks L2 compatibility
- BIP-compliant key management
- GDPR-ready privacy controls
- SOC2-type access auditing through public blockchain

## Deployment Information

### Network Requirements

- Stacks 2.1+ node
