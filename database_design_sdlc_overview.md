# 🧠 Database Design and SDLC Overview

This README provides a clear and concise guide to key concepts in the **Software Development Life Cycle (SDLC)**, **database design techniques**, **Entity-Relationship (ER) diagram creation**, **database anomalies**, **normalization**, and **functional dependencies**. It serves as a reference for developers and system designers to understand and apply these principles effectively.

---

## 📌 Software Development Life Cycle (SDLC)

The SDLC is a structured process for developing software systems, ensuring efficient planning, development, and deployment. It consists of the following phases:

1. **Planning**: Define project goals, scope, resources, and timelines.
2. **Analysis/Reasoning**: Gather and analyze requirements from stakeholders.
3. **System Design**: Create system architecture and detailed design specifications.
4. **Building**: Develop the system through coding and implementation.
5. **Testing**: Verify and validate the system to ensure it meets requirements.
6. **Deployment/Launch**: Release the system to production for end-user access.

### ⚙️ SDLC Methodologies

- **Agile Methodology**: Iterative and flexible, prioritizing collaboration and adaptability to changing requirements.
- **Waterfall Methodology**: Linear and sequential, with distinct, non-overlapping phases.

---

## 🧱 Database Design Techniques

Effective database design is essential for scalable and maintainable systems. Two primary approaches include:

### 🔼 Top-Down Technique

- Start with high-level requirements.
- Refine into detailed schemas.
- Ideal for new projects designed from scratch.

### 🔽 Bottom-Up Technique

- Build from existing data sources or systems.
- Often involves reverse-engineering or integrating legacy systems.

---

## 📊 Creating an Entity-Relationship (ER) Diagram

An ER diagram visually represents the database structure, including entities, attributes, and relationships.

### Step 1: Determine Entities

Entities represent objects (e.g., `Student`, `Mentor`) and must:

- Represent a **Place**, **Person**, or **Thing**
- Have **Properties or Attributes**
- Have a **Unique Identity**
- Use **Singular Names**
- Be capable of having **multiple data instances**

### Step 2: Determine Attributes

Attributes must:

- Be directly related to the entity
- Be **atomic** (single-valued)
- Include keys (Primary/Foreign)

### Step 3: Define Relationships

Relationships describe how entities are connected. Common types:

- 🧍‍♂️🔗🧍‍♂️ **One-to-One**
- 🧍‍♂️🔗👥 **One-to-Many**
- 👥🔗🧍‍♂️ **Many-to-One**
- 👥🔗👥 **Many-to-Many**
- 🧍‍♂️🔗(Optional) **Optional One-to-One or Zero**
- 👥🔗(Optional)👥 **Optional Many-to-Many**

> 📝 **Note**: Many-to-Many relationships can introduce complexity. Use **junction tables** to simplify them into manageable one-to-many relationships.

---

## 🐞 Database Anomalies

Anomalies are inconsistencies that can occur during data manipulation:

- **Update Anomaly**: Inconsistent updates due to redundant data.
- **Delete Anomaly**: Unintended data loss when deleting records.
- **Insert Anomaly**: Difficulty inserting data due to missing dependencies.

---

## 🔄 Normalization

Normalization is the process of organizing data to:

- 📉 **Reduce redundancy**
- ✅ **Improve data integrity**

### 🔢 Common Normal Forms

| Normal Form | Description                             |
| ----------- | --------------------------------------- |
| **0NF**     | Unnormalized, contains repeating groups |
| **1NF**     | Atomic values, structured table         |
| **2NF**     | No partial dependencies                 |
| **3NF**     | No transitive dependencies              |

### ✅ Rules for 1NF

- Atomic values
- Unique column names
- Positional independence
- Consistent data types per column
- Primary key present

### ✅ Rules for 2NF

- Must be in 1NF
- No non-key attribute depends on a **proper subset** of any candidate key

#### 📌 Partial Dependency

Occurs when a non-key column depends on **part** of a composite key.

**Fix**: Move such columns to a separate table with a single-key dependency.

### ✅ Rules for 3NF

- Must be in 2NF
- No **transitive dependencies** (non-key → non-key)

---

## 🧬 Functional Dependency

A **functional dependency** describes a relationship where one column determines another.

> If **X → Y**, then if two rows have the same value for X, they must have the same value for Y.

**Example**:  
If `t1.x = t2.x`, then `t1.y = t2.y`.

---

## 🧩 Decomposition

Decomposition = splitting a big table into smaller ones to improve design (common in normalization).

- ⚠️ **Lossy Decomposition**: Risk of **losing or corrupting** data when joining tables.
- ✅ **Goal**: Maintain integrity and ensure complete data reconstruction.

---

## ✅ Conclusion

This README offers a foundational understanding of:

- Software Development Life Cycle (SDLC)
- Database Design Techniques
- ER Diagrams
- Database Anomalies
- Normalization (1NF, 2NF, 3NF)
- Functional Dependencies
- Decomposition

By applying these principles, developers can build **robust**, **efficient**, and **scalable** database systems.

> 📚 For further reading, consult database documentation or collaborate with DBAs and system architects.

---

Happy Designing! 🎉  
_– Because great databases start with great design._
